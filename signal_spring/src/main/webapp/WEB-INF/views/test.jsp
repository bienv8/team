<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
  background-color: #000;
}

.overlay {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: -webkit-gradient(linear, left top, left bottom, from(rgba(14, 29, 51, 0.8)), to(rgba(14, 29, 51, 0.2)));
  background: linear-gradient(to bottom, rgba(14, 29, 51, 0.8), rgba(14, 29, 51, 0.2));
}

.hero-slider {
  width: 100%;
  height: 100vh;
  overflow: hidden;
}
.hero-slider .carousel-cell {
  width: 100%;
  height: 100%;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
.hero-slider .carousel-cell .inner {
  position: relative;
  top: 50%;
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
  color: white;
  text-align: center;
}
.hero-slider .carousel-cell .inner .subtitle {
  font-family: "Roboto Slab", serif;
  font-size: 2.2rem;
  line-height: 1.2em;
  font-weight: 200;
  font-style: italic;
  letter-spacing: 3px;
  color: rgba(255, 255, 255, 0.5);
  margin-bottom: 5px;
}
.hero-slider .carousel-cell .inner .title {
  font-family: "Montserrat", sans-serif;
  font-size: 3rem;
  line-height: 1.2em;
  text-transform: uppercase;
  letter-spacing: 3px;
  margin-bottom: 40px;
}
.hero-slider .carousel-cell .inner .btn {
  border: 1px solid #fff;
  padding: 14px 18px;
  text-transform: uppercase;
  font-family: "Montserrat", sans-serif;
  font-size: 0.8rem;
  letter-spacing: 3px;
  color: #fff;
  text-decoration: none;
  -webkit-transition: all .2s ease;
  transition: all .2s ease;
}
.hero-slider .carousel-cell .inner .btn:hover {
  background: #fff;
  color: #000;
}
.hero-slider .flickity-prev-next-button {
  width: 80px;
  height: 80px;
  background: transparent;
}
.hero-slider .flickity-prev-next-button:hover {
  background: transparent;
}
.hero-slider .flickity-prev-next-button .arrow {
  fill: white;
}
.hero-slider .flickity-page-dots {
  bottom: 30px;
}
.hero-slider .flickity-page-dots .dot {
  width: 30px;
  height: 4px;
  opacity: 1;
  background: rgba(255, 255, 255, 0.5);
  border: 0 solid white;
  border-radius: 0;
}
.hero-slider .flickity-page-dots .dot.is-selected {
  background: #ff0000;
  border: 0 solid #ff0000;
}
</style>


<body>
<div class="hero-slider" data-carousel>
  <div class="carousel-cell" style="background-image:url(https://68.media.tumblr.com/57836ee52bc9355ad7c5fed5abf91ccc/tumblr_oiboo6MaRS1slhhf0o1_1280.jpg);">
    <div class="overlay"></div>
    <div class="inner">
      <h3 class="subtitle">Login</h3>
      <h2 class="title">Tipple Liquor</h2>
      <a href="https://flickity.metafizzy.co/" target="_blank" class="btn">Tell me more</a>
    </div>
  </div>

</div>
</body>
</html>