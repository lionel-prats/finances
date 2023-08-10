(function() {
    document.addEventListener('DOMContentLoaded', function() {
        initApp();
    });
    function initApp(){
        showAccounts();
    }
    function showAccounts(){
        const accounts = findAccountsByUser();
    }
    function findAccountsByUser(){
        const user = getUser();
        const data = accountsByUser(user);
        return data;
    }
    function getUser(){
        const urlParams = new URLSearchParams(window.location.search);
        const user = Object.fromEntries(urlParams.entries());
        return user.user;
    }
    async function accountsByUser(user){
        const data = new FormData();
        data.append('user', user);
        data.append('pinocho', "moscardon");
        try {
            const url = 'http://localhost:3000/api/accounts-by-user';
            const response = await fetch(url, {
                method: 'POST',
                body: data
            });
            const result = await response.json();
            return result;
            // const legendFormCrearTarea = document.querySelector('.formulario legend');
            // mostrarAlerta(resultado.mensaje, resultado.tipo, legendFormCrearTarea);

            // if(resultado.tipo === 'exito'){
            //     document.querySelector('.submit-nueva-tarea').disabled = true;
            //     setTimeout(() => {
            //         modal.remove();
            //     }, 3000);
            // }
            
        } catch (err) {
            console.log(err);
        }
    }
})();
