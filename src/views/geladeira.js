const url="http://localhost:3000/";

async function carregarDadosFreezer(){
    let tbody = document.getElementById("table_freezer");
    tbody.innerHTML = "";
    try {
        const response = await fetch(`${url}api/freezer`, {
            method: 'GET',
            dataType: 'json',
        })
        const result = await response.json();
        result.forEach(element => {
            let tr = document.createElement('tr');
            date = element.validity
            tr.innerHTML = `
            <td class="col-1">
                ${element.id}
            </td>
            <td class="col-3">
                ${element.name}
            </td>
            <td class="col-5">
                ${element.description}
            </td>
            <td class="col-2">
                ${date.substring(0, 10)}
            </td>
            `;
            tbody.appendChild(tr);
        });
    } catch (error) {
        alert("Error: ", error);
    };
};

async function carregarDadosGeladeira(){
    let tbody = document.getElementById("table_fridge");
    tbody.innerHTML = "";
    try {
        const response = await fetch(`${url}api/fridge`, {
            method: 'GET',
            dataType: 'json',
        })
        const result = await response.json();
        result.forEach(element => {
            let tr = document.createElement('tr');
            date = element.validity
            tr.innerHTML = `
            <td class="col-1">
                ${element.id}
            </td>
            <td class="col-3">
                ${element.name}
            </td>
            <td class="col-5">
                ${element.description}
            </td>
            <td class="col-2">
                ${date.substring(0, 10)}
            </td>
            `;
            tbody.appendChild(tr);
        });
    } catch (error) {
        alert("Error: ", error);
    };
};

async function gravar() {
    let onde = document.getElementById("teste").value
    let name = document.getElementById('name');
    let description = document.getElementById('description');
    let validity = document.getElementById('validity');

    let data = {
        id: i_id,
        name: name.value,
        description: description.value,
        validity: validity.value,
    }

    try{
        const response = await fetch(`${url}api/`, {
            method: "POST",
            dataType: 'json',
            contentType: 'aplication/json; charset=utf-8',
            body: JSON.stringify(data)
        }).then(result => {
            carregarDadosFreezer();
            carregarDadosGeladeira();
        })
    } catch (error) {
        alert("Error: ", error);
    }
}

async function excluir(selected_id) {
    try {
        console.log(selected_id)
        const response = await fetch(`${url}api/products/${selected_id}`, {
            method: 'DELETE'
        });

        if (!response.ok) {
            throw new Error('Erro ao excluir o produto');
        }

        const result = await response.json();
        console.log('Produto excluído com sucesso:', result);
    } catch (error) {
      console.log("socorro")
    }
    carregarDadosGeladeira()
    carregarDadosFreezer()
}
