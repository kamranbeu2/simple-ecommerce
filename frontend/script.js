
const PRODUCT_SERVICE_URL = "/api/products";
const USER_SERVICE_URL = "/api/users";

document.addEventListener('DOMContentLoaded', () => {
    const productsSection = document.getElementById('products-section');
    const usersSection = document.getElementById('users-section');
    const showProductsBtn = document.getElementById('show-products');
    const showUsersBtn = document.getElementById('show-users');

    function hideAllSections() {
        productsSection.classList.add('hidden');
        usersSection.classList.add('hidden');
    }

    showProductsBtn.addEventListener('click', () => {
        hideAllSections();
        productsSection.classList.remove('hidden');
        loadProducts();
    });

    showUsersBtn.addEventListener('click', () => {
        hideAllSections();
        usersSection.classList.remove('hidden');
        loadUsers();
    });

    async function loadProducts() {
        const productList = document.getElementById('product-list');
        productList.innerHTML = '<li>Loading products...</li>';
        try {
            const response = await fetch(PRODUCT_SERVICE_URL);
            const products = await response.json();
            productList.innerHTML = '';
            products.forEach(product => {
                const li = document.createElement('li');
                li.textContent = `${product.name} – $${product.price}`;
                productList.append(li);
            });
        } catch (error) {
            productList.innerHTML = '<li>Error loading products</li>';
        }
    }

    async function loadUsers() {
        const userList = document.getElementById('user-list');
        userList.innerHTML = '<li>Loading users...</li>';
        try {
            const response = await fetch(USER_SERVICE_URL);
            const users = await response.json();
            userList.innerHTML = '';
            users.forEach(user => {
                const li = document.createElement('li');
                li.textContent = `${user.username} (${user.email})`;
                userList.append(li);
            });
        } catch (error) {
            userList.innerHTML = '<li>Error loading users</li>';
        }
    }

    document.getElementById('product-form').addEventListener('submit', async e => {
        e.preventDefault();
        const name = document.getElementById('product-name').value;
        const description = document.getElementById('product-desc').value;
        const price = document.getElementById('product-price').value;

        try {
            await fetch(PRODUCT_SERVICE_URL, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ name, description, price })
            });
            loadProducts();
            e.target.reset();
        } catch (error) {
            alert('Error adding product');
        }
    });

    document.getElementById('user-form').addEventListener('submit', async e => {
        e.preventDefault();
        const username = document.getElementById('username').value;
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;

        try {
            await fetch(USER_SERVICE_URL, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username, email, password })
            });
            loadUsers();
            e.target.reset();
        } catch (error) {
            alert('Error adding user');
        }
    });

    showProductsBtn.click();
});