document.addEventListener("DOMContentLoaded", function () {
  new SweetScroll({/* some options */});

  /* particlesJS.load(@dom-id, @path-json, @callback (optional)); */
  particlesJS('particles-js', {
    "particles": {
      "number": {
        "value": 75, // Number of vertices
        "density": {
          "enable": true,
          "value_area": 800 // Denser the smaller the number
        }
      },
      "color": { // The color for every node, not the connecting lines.
        "value": "#ffffff" // Or use an array of colors like ["#9b0000", "#001378", "#0b521f"]
      },
      "shape": {
        "type": "circle", // Can show circle, edge (a square), triangle, polygon, star, img, or an array of multiple.
        "stroke": { // The border
          "width": 0,
          "color": "#000000"
        },
        "polygon": { // If the shape is a polygon
          "nb_sides": 10 // Number of sides on the shape
        },
        "image": { // If the shape is an image
          "src": "img/github.svg",
          "width": 100,
          "height": 100
        }
      },
      "opacity": {
        "value": 0.5,
        "random": false,
        "anim": {
          "enable": false,
          "speed": 1,
          "opacity_min": 0.1,
          "sync": false
        }
      },
      "size": {
        "value": 5, // Size of the vertex
        "random": true, // Some random variation for vertex size
        "anim": {
          "enable": false,
          "speed": 19.18081918081918,
          "size_min": 0.1,
          "sync": false
        }
      },
      "line_linked": {
        "enable": true,
        "distance": 100, // Distance to add connecting line
        "color": "#ffffff",
        "opacity": 0.4,
        "width": 1.5
      },
      "move": {
        "enable": true,
        "speed": 5, // Speed of vertex movement
        "direction": "none", // Move them off the canvas, either "none", "top", "right", "bottom", "left", "top-right", "bottom-right" et cetera...
        "random": true,
        "straight": false, // Whether they'll shift left and right while moving.
        "out_mode": "out", // What it'll do when it reaches the end of the canvas, either "out" or "bounce".
        "bounce": false,
        "attract": { // Make them start to clump together while moving.
          "enable": false,
          "rotateX": 600,
          "rotateY": 1200
        }
      },
      nb: 80
    },
    "interactivity": {
      "detect_on": "canvas",
      "events": {
        "onhover": {
          "enable": true, // React to a hovering mouse
          "mode": "grab" // Connect to nearest vertices with edge
        },
        "onclick": {
          "enable": true, // React to the click of mouse
          "mode": "push" // Add new points
        },
        "resize": true // Resize with window
      },
      "modes": {
        "grab": { // Add lines to mouse
          "distance": 100,
          "line_linked": {
            "opacity": 1
          }
        },
        "bubble": { // Highlight (by increasing in size) all vertices in area
          "distance": 400,
          "size": 40,
          "duration": 2,
          "opacity": 8,
          "speed": 3
        },
        "repulse": { // Repell vetices in area
          "distance": 150,
          "duration": 0.4
        },
        "push": { // Add new vertices
          "particles_nb": 4
        },
        "remove": { // Remove vertices
          "particles_nb": 2
        }
      }
    },
    "retina_detect": true
  });

}, false);
