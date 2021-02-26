import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Adopt a pet", "Donate a pet"],
    typeSpeed: 50,
    loop: true,
  });
}

export { loadDynamicBannerText };