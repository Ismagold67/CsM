document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.getElementById("searchInput");
    const suggestionsBox = document.getElementById("search-suggestions");
    const suggestedCoursesContainer = document.getElementById("suggested-courses");
    let debounceTimer = null; // 🔹 Para evitar múltiplas requisições simultâneas

    // 🔹 Captura a digitação do usuário com debounce (evita requisições excessivas)
    searchInput.addEventListener("input", function() {
        const searchTerm = searchInput.value.trim();

        // Esconde sugestões se for menor que 3 caracteres
        if (searchTerm.length < 1) {
            suggestionsBox.style.display = "none";
            return;
        }

        // Limpa qualquer requisição anterior antes de fazer uma nova (debounce)
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            fetchSearchSuggestions(searchTerm);
        }, 300); // 🔹 Aguarda 300ms antes de fazer a requisição
    });

    // 🔹 Função para buscar sugestões da API
    async function fetchSearchSuggestions(searchTerm) {
        try {
            const response = await fetch(`${config.backendUrl}/search?search=${encodeURIComponent(searchTerm)}`);
            if (!response.ok) throw new Error("Erro na resposta da API");

            const data = await response.json();
            if (!data.search_result || !Array.isArray(data.search_result) || data.search_result.length === 0) {
                suggestionsBox.style.display = "none";
                return;
            }

            displaySearchSuggestions(data.search_result);
        } catch (error) {
            console.error("Erro ao buscar sugestões:", error);
            suggestionsBox.style.display = "none"; // Esconde a lista se houver erro
        }
    }

    // 🔹 Função para exibir sugestões dinâmicas
    function displaySearchSuggestions(results) {
        suggestionsBox.innerHTML = ""; // Limpa sugestões anteriores
        suggestionsBox.style.display = "block"; // Exibe a lista

        results.forEach(item => {
            const suggestionItem = document.createElement("div");
            suggestionItem.classList.add("suggestion-item");
            suggestionItem.textContent = item.name;

            // 🔹 Quando o usuário clica, preenche o campo e esconde a lista
            suggestionItem.addEventListener("click", () => {
                searchInput.value = item.name;
                suggestionsBox.style.display = "none";
            });

            suggestionsBox.appendChild(suggestionItem);
        });
    }

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

            renderCourses(data.courses.slice(0, 10), "course-list", 'course'); // 🔹 Mostra 10 cursos recomendados

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

// 🔹 Função para renderizar os instrutores
function renderInstructors(instructors) {
    const container = document.getElementById("instructors-list");
    if (!container) return;

    container.innerHTML = ""; // 🔹 Limpa os instrutores anteriores

    instructors.forEach(instructor => {
        const instructorCard = document.createElement("div");
        instructorCard.classList.add("instructor");

        instructorCard.innerHTML = `
            <img src="${instructor.instructor_image}" alt="${instructor.instructor_name}">
            <div class="instructor-info">
                <h3><strong>${instructor.instructor_name}</strong></h3>
                <p>${instructor.instructor_bio}</p>
            </div>
        `;

        container.appendChild(instructorCard);
    });
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

// FUNÇÃO PARA OUVIR O EVENTO DE CLICK NO BOTÃO
// function addCourseInWish(course) {
//     const btnAdd = document.querySelector(".btn-add")
//     btnAdd.addEventListener("click", () => {
//         // DEIXAR O ID DO USUÁRIO DINÂMICO
//         addWishToList('6a90b9da-f624-4487-b67c-9789228f8c2f', course.course_id)
//         btnAdd.innerHTML = `<strong>Adicionado!</strong>${course}`
//     })
// }

// FUNÇÃO ASSÍNCRONA PARA ADICIONAR CURSO A LISTA DE INTERESSE
// async function addWishToList(userId, courseId) {
//     try {
//         const response = await fetch(`${config.backendUrl}/add_wish_in_list`, {
//             method: 'POST',
//             headers: {
//                 'Content-Type': 'application/json'
//             },
//             body: JSON.stringify({
//                 user_id: userId,
//                 course_id: courseId
//             })
//         });

//         const data = await response.json()
//         if(response.ok) {
//             console.log('🆗', data.message)
//         } else {
//             console.error("Error:", data.message)
//         }

//     }catch (error) {
//         console.error("Erro ao adicionar à wishlist", error)
//     }
// }


// 🔹 Chama a função ao carregar a página
fetchInstructors();

