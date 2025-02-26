document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.getElementById("searchInput");
    const suggestionsBox = document.getElementById("search-suggestions");

    // 🔹 Esconder sugestões ao clicar fora do campo de busca
    document.addEventListener("click", (event) => {
        if (!suggestionsBox.contains(event.target) && event.target !== searchInput) {
            suggestionsBox.style.display = "none";
        }
    });

    // 🔹 Função para buscar cursos sugeridos na API
    async function fetchSuggestedCourses() {
        try {
            const response = await fetch(`${config.backendUrl}/recommended_card_courses?user_id=6a90b9da-f624-4487-b67c-9789228f8c2f`);
            const data = await response.json();

            if (!data.courses || !Array.isArray(data.courses) || data.courses.length === 0) {
                console.warn("Nenhum curso recomendado encontrado.");
                return;
            }

            renderCourses(data.courses.slice(0, 3), "wish-list", 'wish'); // 🔹 Mostra 10 cursos recomendados

        } catch (error) {
            console.error("Erro ao buscar cursos recomendados:", error);
        }
    }

    // 🔹 Chama a função para exibir os cursos sugeridos na pesquisa
    fetchSuggestedCourses();
});

async function fetchInstructors() {
    try {
        const response = await fetch(`${config.backendUrl}/top_instructors`);
        const data = await response.json();

        if (!data.instructors || !Array.isArray(data.instructors)) {
            console.error("Nenhum instrutor encontrado:", data);
            return;
        }

        renderInstructors(data.instructors);

    } catch (error) {
        console.error("Erro ao buscar instrutores:", error);
    }
}

function showCourseDetails(course) {
    document.querySelector(".course-list").style.display = "none"; 
    document.querySelector(".instructors-list").style.display = "none"; 
    document.querySelector(".search-bar").style.display = "none"; 
    document.querySelectorAll(".section-title").forEach(item => {item.style.display = "none";}) 
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
    document.querySelector(".course-list").style.display = "flex"; // Exibe os cursos novamente
    document.querySelector(".instructors-list").style.display = "block"; // Exibe os cursos novamente
    document.querySelector(".search-bar").style.display = "flex";  // Exibe a header novamente
    document.querySelectorAll(".section-title").forEach(item => {item.style.display = "flex";}) 
});

fetchInstructors()