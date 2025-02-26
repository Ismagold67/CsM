// 🔹 Função para renderizar cursos dinamicamente em todas as divs com determinada classe, evitando repetições
function renderCourses(courses, containerClass, divname) {
    const containers = document.querySelectorAll(`.${containerClass}`);
    if (!containers.length) return; // 🔹 Se não houver containers, sai da função

    let remainingCourses = [...courses]; // 🔹 Copia o array para evitar mutações

    containers.forEach(container => {
        if (remainingCourses.length === 0) return; // 🔹 Se não há cursos restantes, para

        const coursesToRender = remainingCourses.slice(0, 10); // 🔹 Define um limite de 10 cursos por container
        remainingCourses = remainingCourses.slice(10); // 🔹 Atualiza os cursos restantes

        // 🔹 Limpa o container antes de renderizar
        container.innerHTML = "";

        coursesToRender.forEach(course => {
            const courseCard = document.createElement("div");
            courseCard.classList.add(`${divname}`);

            // 🔹 Obtém a média da avaliação e gera as estrelas com FontAwesome
            const rating = Number(course.average_rating || 0).toFixed(1);
            const starsHTML = generateStarsHTML(rating);

            courseCard.innerHTML = `
                <div class="loader"></div> <!-- Loader aparece antes da imagem -->
                <img src="${course.url_capa_curso}" alt="Curso" style="display: none;">
                <div class='content-wish'>
                    <h3><strong>${course.course_title}</strong></h3>
                    <p><strong>Criador: ${course.instructor_name}</strong></p>
                    <p class="stars"><strong>Avaliação: ${rating} ${starsHTML}</strong></p>
                <div>
            `;

            // 🔹 Seleciona os elementos dentro do card
            const img = courseCard.querySelector("img");
            const loader = courseCard.querySelector(".loader");

            // 🔹 Evento: Quando a imagem carregar, remove o loader e exibe a imagem
            img.onload = () => {
                loader.style.display = "none";
                img.style.display = "block";
            };

            // 🔹 Adiciona evento de clique para exibir detalhes do curso
            courseCard.addEventListener("click", () => showCourseDetails(course));

            container.appendChild(courseCard);
        });
    });
}

// 🔹 Função para gerar estrelas corretamente com FontAwesome
function generateStarsHTML(rating) {
    const fullStars = Math.floor(rating);
    const halfStar = rating % 1 >= 0.5 ? 1 : 0;
    const emptyStars = 5 - fullStars - halfStar;

    let starsHTML = "";
    for (let i = 0; i < fullStars; i++) {
        starsHTML += `<i class="fa-solid fa-star star-color"></i>`;
    }
    if (halfStar) {
        starsHTML += `<i class="fa-solid fa-star-half-stroke star-color"></i>`;
    }
    for (let i = 0; i < emptyStars; i++) {
        starsHTML += `<i class="fa-regular fa-star star-color"></i>`;
    }

    return starsHTML;
}