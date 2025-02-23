document.addEventListener("DOMContentLoaded", async function () {
    const userId = "6a90b9da-f624-4487-b67c-9789228f8c2f"; // ID do usuário
    const progressPercentage = document.getElementById("progress-percentage");
    const progressBar = document.querySelector(".progress-fill");
    const courseList = document.querySelector(".course-progress-list");

    try {
        const response = await fetch(`${config.backendUrl}/recommended_card_courses?user_id=${userId}`);
        const data = await response.json();

        if (!data.courses || !Array.isArray(data.courses) || data.courses.length === 0) {
            console.error("Nenhum curso encontrado:", data);
            return;
        }
        const h2_header = document.querySelector(".progress-container h2")
        const user_name = data.courses[0].user_name

        // 🔹 Simula o progresso baseado na quantidade de cursos
        let progress = Math.min(30, data.courses.length * 10); // 10% por curso
        progressPercentage.textContent = `${progress}%`;
        progressBar.style.width = `${progress}%`;
        h2_header.textContent = `Olá, ${user_name}`

        // 🔹 Renderiza os cursos em andamento
        data.courses.slice(0, 4).forEach(course => { // Pega no máximo 4 cursos para exibição
            const courseItem = document.createElement("div");
            courseItem.addEventListener("click", function() {
                window.location.href = "classes.html"; // Redireciona para a página das aulas
            });
            courseItem.classList.add("course-progress");

            courseItem.innerHTML = `
                <img src="../src/imgs/computer-icon.png" alt="Ícone do curso">
                <div class="course-info">
                    <h3>${course.course_title}</h3>
                    <p>Pontos: 20</p>
                    <p>2h 30min</p>
                </div>
            `;

            courseList.appendChild(courseItem);
        });

    } catch (error) {
        console.error("Erro ao buscar cursos:", error);
    }
});


