/**
 * 모바일 메뉴 토글
 * - 상태는 버튼의 aria-expanded 하나로 관리하고, CSS도 이 값을 기준으로 메뉴를 보이거나 숨긴다.
 * - JS가 없으면 버튼은 hidden으로 남고 메뉴는 펼쳐진 채로 노출된다.
 */
const DESKTOP_QUERY = '(min-width: 64em)';

export function initMobileMenu() {
  const toggle = document.querySelector('.nav-toggle');
  const header = document.querySelector('.site-header');
  const menu = toggle && document.getElementById(toggle.getAttribute('aria-controls'));
  if (!toggle || !header || !menu) return;

  const label = toggle.querySelector('.nav-toggle__label');
  const desktop = window.matchMedia(DESKTOP_QUERY);

  const isOpen = () => toggle.getAttribute('aria-expanded') === 'true';

  const setOpen = (open) => {
    toggle.setAttribute('aria-expanded', String(open));
    if (label) label.textContent = open ? '메뉴 닫기' : '메뉴 열기';
  };

  const close = ({ returnFocus = false } = {}) => {
    if (!isOpen()) return;
    setOpen(false);
    if (returnFocus) toggle.focus();
  };

  toggle.hidden = false;
  setOpen(false);

  toggle.addEventListener('click', () => setOpen(!isOpen()));

  // 메뉴 항목을 누르면 닫고, 링크 기본 동작으로 해당 섹션으로 이동한다
  menu.addEventListener('click', (event) => {
    if (event.target.closest('a')) close();
  });

  // Esc: 메뉴가 열려 있으면 닫고 토글 버튼으로 포커스를 돌려준다
  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && isOpen()) close({ returnFocus: true });
  });

  // 포커스나 클릭이 헤더 밖으로 나가면 닫는다 (포커스는 옮기지 않는다).
  // relatedTarget이 없는 경우(다른 창·탭으로 전환)는 닫지 않는다. 빈 곳 클릭은 아래 click에서 처리한다.
  header.addEventListener('focusout', (event) => {
    const next = event.relatedTarget;
    if (next && !header.contains(next)) close();
  });

  document.addEventListener('click', (event) => {
    if (!header.contains(event.target)) close();
  });

  // 데스크톱 폭으로 바뀌면 상태를 초기화한다
  desktop.addEventListener('change', (event) => {
    if (event.matches) close();
  });
}
