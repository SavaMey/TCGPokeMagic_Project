let carrito = [];

function agregarAlCarrito(id, nombre, precio) {
    const mensajeError = document.getElementById("mensaje_carrito_vacio");
    if (mensajeError) mensajeError.remove();

    const cartaExistente = carrito.find(item => item.id === id);
    if (cartaExistente) {
        cartaExistente.cantidad += 1;
    } else {
        carrito.push({id, nombre, precio, cantidad: 1});
    }
    mostrarCarrito();
    alert("Carta al carrito ugu");
}

function mostrarCarrito() {
    const carritoItems = document.getElementById("carrito_items");
    const carritoTotal = document.getElementById("carrito_total");

    carritoItems.innerHTML = "";

    let total = 0;

    carrito.forEach(item => {
        const itemTotal = item.precio * item.cantidad;
        total += itemTotal;

        const li = document.createElement("li");
        li.className = "carrito_item";
        li.textContent = `${item.nombre} (x${item.cantidad}) - $${itemTotal.toLocaleString('es-CL')}`;

        carritoItems.appendChild(li);
    });

    carritoTotal.textContent = total.toLocaleString('es-CL');
}

function irAPagar() {
    if (carrito.length === 0) {
        errorCarritoVacio();
        return;
    }
    window.location.href = "formulariopago.html";
}

function errorCarritoVacio() {
    const mensajePrevio = document.getElementById("mensaje_carrito_vacio");
    if (mensajePrevio) mensajePrevio.remove();

    const mensaje = document.createElement("p");
    mensaje.id = "mensaje_carrito_vacio";
    mensaje.textContent = "ERROR: El carro ta vacio, agrega al menos una carta";
    mensaje.style.color = "red";

    const carritoDiv = document.querySelector(".carrito");
    carritoDiv.insertBefore(mensaje, carritoDiv.firstChild.nextSibling);

    carritoDiv.scrollIntoView({ behavior: "smooth", block: "center" });
}


function validarFormulario() {
    const inputs = document.querySelectorAll("#formulario_pago input");
    inputs.forEach(input => {
        input.classList.remove("input_error");
    });

    const mensajePrevio = document.getElementById("mensaje_error");
    if (mensajePrevio) mensajePrevio.remove();

    let campoVacio = null;

    inputs.forEach(input => {
        if (input.value.trim() === "" && !campoVacio) {
            campoVacio = input;
        }
        if (input.value.trim() === "") {
            input.classList.add("input_error");
        }
    });

    if (campoVacio) {

        const mensaje = document.createElement("p");
        mensaje.id = "mensaje_error";
        mensaje.textContent = "Por favor, completa todos los campos.";
        mensaje.style.color = "red";
        campoVacio.closest("main").insertBefore(mensaje, campoVacio.closest("main").firstChild.nextSibling);


        campoVacio.focus();
        campoVacio.scrollIntoView({behavior: "smooth", block: "center"});

        return false;
    }
    return true;
}

function completarPago() {
    if (!validarFormulario()) {
        return;
    }
    window.location.href = "pagocompletado.html";
}