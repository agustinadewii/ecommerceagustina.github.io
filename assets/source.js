/*======================== membuat navbar tetap diatas ========================*/
let header = document.querySelector("header");

header.classList.toggle("sticky", window.scrollY > 100);

document.getElementById("year").innerHTML = new Date().getFullYear();

function buy(product_name, product_price) {
  const message = `Halo saya mau beli ${product_name} - ${product_price}`;
  const whatsapp = `https://wa.me/6285964112827?text=${message}`;
  open(whatsapp, "_blank");
}

function chat() {
  const message = `Halo Min Saya Mau Tanya Nih tentang Productnya..... `;
  const whatsapp = `https://wa.me/6285964112827?text=${message}`;
  open(whatsapp, "_blank");
}

new Splide(".splide").mount();
