async function fetchCourses() {
    try {
        const response = await fetch(`${config.backendUrl}/recommended_card_courses?user_id=6a90b9da-f624-4487-b67c-9789228f8c2f`);
        //const username
        const data = await response.json();
        const h2_header = document.querySelector(".header h2")
        const user_name = data.courses[0].user_name
        if (!data.courses || !Array.isArray(data.courses)) {
            console.error("Nenhum curso encontrado:", data);
            return;
        }

        // 🔹 Renderiza os cursos na página principal usando a função reutilizável
        renderCourses(data.courses, "course-list", 'course');
        h2_header.textContent = `Olá, ${user_name}`

    } catch (error) {
        console.error("Erro ao buscar cursos:", error);
    }
}

function showCourseDetails(course) {
    document.querySelectorAll(".course-list").forEach(item => {item.style.display = "none"; })// Esconde a lista de cursos
    document.querySelector(".header").style.display = "none"; // Esconde a HEADER
    document.querySelectorAll(".section-title").forEach(item => {item.style.display = "none";}) // Esconde a HEADER
    const details = document.querySelector(".details");
    const rating = Number(course.average_rating).toFixed(1);
    const starsHTML = generateStarsHTML(rating);

    document.getElementById("course-image").src = course.url_capa_curso;
    document.getElementById("course-title").textContent = course.course_title;
    document.getElementById("course-instructor").textContent = `Criador: ${course.instructor_name}`;
    document.getElementById("course-rating").innerHTML = `Avaliação: ${rating} ${starsHTML}`;
    document.getElementById("course-description").textContent = course.description;

    details.style.display = "block"; // Exibe os detalhes do curso
}

// Voltar para a lista de cursos
document.querySelector(".back-button").addEventListener("click", () => {
    document.querySelector(".details").style.display = "none"; // Esconde os detalhes
    document.querySelectorAll(".course-list").forEach(item => {item.style.display = "flex";}) // Exibe os cursos novamente
    document.querySelector(".header").style.display = "flex";  // Exibe a header novamente
    document.querySelectorAll(".section-title").forEach(item => {item.style.display = "block"}); 
});


// 🔹 Chama a função ao carregar a página
fetchCourses();
