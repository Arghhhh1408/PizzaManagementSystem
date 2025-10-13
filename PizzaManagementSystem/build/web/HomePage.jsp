<%-- 
    Document   : HomePage
    Created on : 30 thg 9, 2025, 06:16:05
    Author     : dotha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Pizza Management - Home</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background: #fff8f0;
                color: #333;
                display: flex;
                flex-direction: column;
                height: 100vh;
            }

            /* Header */
            header {
                background: #d32f2f;
                color: white;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 10px 20px;
                position: sticky;
                top: 0;
                z-index: 10;
            }
            header .logo {
                font-size: 20px;
                font-weight: bold;
                text-decoration: none;
                color: white;
            }
            header .logo img {
                height: 50px;
            }
            header .search-bar input {
                padding: 6px 10px;
                border: none;
                border-radius: 20px;
                width: 250px;
            }
            header .user {
                position: relative;
                cursor: pointer;
            }
            header .user img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                border: 2px solid white;
            }
            header .dropdown {
                display: none;
                position: absolute;
                right: 0;
                top: 50px;
                background: white;
                color: black;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
                overflow: hidden;
                min-width: 150px;
            }
            header .dropdown a {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: black;
                transition: background 0.3s;
            }
            header .dropdown a:hover {
                background: #f5f5f5;
            }
            header .user:hover .dropdown {
                display: block;
            }

            /* Layout */
            .container {
                display: flex;
                flex: 1;
                overflow: hidden;
            }
            .menu {
                flex: 3;
                padding: 20px;
                overflow-y: auto;
                background: #fff;
            }
            .menu h2 {
                color: #d32f2f;
                margin: 20px 0 10px;
            }
            .menu-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
                gap: 15px;
            }
            .item-card {
                background: #fff8f0;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                text-align: center;
                padding: 12px;
                transition: transform 0.2s, background 0.3s;
                cursor: pointer;
            }
            .item-card:hover {
                transform: translateY(-5px);
            }
            .item-card h3 {
                margin: 5px 0 10px;
                font-size: 15px;
                color: #333;
            }
            .item-card a {
                display: inline-block;
                padding: 5px 10px;
                background: #ffca28;
                border-radius: 20px;
                text-decoration: none;
                color: #333;
                font-weight: bold;
                transition: background 0.3s;
            }
            .item-card a:hover {
                background: #ffc107;
            }
            .order-form {
                display: inline-block;
                margin-top: 5px;
            }
            .order-form input[type="number"] {
                width: 50px;
                padding: 2px;
                margin-right: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .order-form button {
                background: #ffca28;
                border: none;
                padding: 5px 10px;
                border-radius: 20px;
                cursor: pointer;
                font-size: 12px;
                color: #333;
                font-weight: bold;
            }
            .order-form button:hover {
                background: #ffc107;
            }

            /* Bill Section */
            .bill {
                flex: 1;
                background: #fff;
                padding: 20px;
                border-left: 2px solid #f0f0f0;
                box-shadow: -2px 0 6px rgba(0,0,0,0.1);
                position: sticky;
                right: 0;
                top: 0;
                height: 100vh;
                overflow-y: auto;
            }
            .bill h2 {
                color: #d32f2f;
            }
            .bill .item {
                display: flex;
                justify-content: space-between;
                margin: 10px 0;
                padding: 5px;
                border-bottom: 1px solid #eee;
            }
            .bill .no-items {
                text-align: center;
                color: #999;
                font-style: italic;
                margin: 20px 0;
            }
            .bill .summary {
                border-top: 1px solid #ccc;
                margin-top: 15px;
                padding-top: 10px;
            }
            .bill .summary div {
                display: flex;
                justify-content: space-between;
                margin: 5px 0;
            }
            .bill .summary strong {
                font-size: 16px;
            }

            /* Payment Methods */
            .payment-section h3 {
                color: #d32f2f;
                margin-top: 20px;
            }
            .payment-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
                gap: 10px;
                margin-top: 10px;
            }
            .payment-card {
                background: #fff8f0;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                text-align: center;
                padding: 12px;
                transition: transform 0.2s, background 0.3s;
                cursor: pointer;
            }
            .payment-card:hover {
                transform: translateY(-3px);
            }
            .payment-card.active {
                background: #ffca28;
                font-weight: bold;
            }

            .checkout-btn {
                margin-top: 20px;
                padding: 12px;
                width: 100%;
                background: #d32f2f;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 16px;
                transition: background 0.3s;
            }
            .checkout-btn:hover {
                background: #b71c1c;
            }
        </style>
    </head>
    <body>

        <header>
            <a href="#" class="logo">
                <img src="image\z7061951110269_97de656e010792553d34b34b6d1df40c.jpg" alt="Pizza Food Logo">
            </a>
            <div class="search-bar">
                <input type="text" placeholder="Search...">
            </div>
            <div class="user">
                <img src="https://i.pravatar.cc/40" alt="User Avatar">
                <div class="dropdown">
                    <a href="#">Login</a>
                    <a href="#">Register</a>
                    <a href="#">Profile</a>
                </div>
            </div>
        </header>

        <div class="container">

            <div class="menu">
                <c:choose>
                    <c:when test="${not empty menuByCategory}">
                        <c:forEach var="category" items="${menuByCategory.keySet()}">
                            <h2>${category}</h2>
                            <div class="menu-grid">
                                <c:forEach var="item" items="${menuByCategory.get(category)}">
                                    <div class="item-card">
                                        <h3>${item.name}</h3>
                                        <p style="font-size: 12px; color: #666;">$${item.price}</p>
                                        <p style="font-size: 11px; color: #999;">${item.description}</p>
                                        <form class="order-form" action="CartServlet" method="post">
                                            <input type="hidden" name="action" value="add">
                                            <input type="hidden" name="itemID" value="${item.itemID}">
                                            <input type="number" name="quantity" value="1" min="1" max="10">
                                            <button type="submit">Order</button>
                                        </form>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>No menu items available.</p>
                    </c:otherwise>
                </c:choose>
        </div>

        <div class="bill">
            <h2>Your Bill</h2>
            <div class="item"><span>Table</span><span>#${sessionScope.tableNumber != null ? sessionScope.tableNumber : '--'}</span></div>

            <c:choose>
                <c:when test="${not empty sessionScope.cart and not empty sessionScope.cart}">
                    <c:set var="totalOrder" value="0.0" />
                    <c:forEach var="orderItem" items="${sessionScope.cart}">
                        <c:set var="subTotal" value="${orderItem.quantity * orderItem.price}" />
                        <div class="item">
                            <span>${orderItem.itemName} (x${orderItem.quantity})</span>
                            <span><fmt:formatNumber value="${subTotal}" type="currency" currencySymbol="$" maxFractionDigits="2"/></span>
                        </div>
                        <c:set var="totalOrder" value="${totalOrder + subTotal}" />
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="no-items">No items in cart yet.</div>
                    <c:set var="totalOrder" value="0.0" />
                </c:otherwise>
            </c:choose>

            <div class="summary">
                <div><span>Total Order</span><span><fmt:formatNumber value="${totalOrder}" type="currency" currencySymbol="$" maxFractionDigits="2"/></span></div>
                <div><span>VAT/Tax</span><span>10%</span></div>
                <c:set var="totalBill" value="${totalOrder * 1.1}" />
                <div><strong>Total Bill</strong><strong><fmt:formatNumber value="${totalBill}" type="currency" currencySymbol="$" maxFractionDigits="2"/></strong></div>
            </div>

            <!-- Payment Methods -->
            <div class="payment-section">
                <h3>Payment Method</h3>
                <div class="payment-grid">
                    <div class="payment-card">QR Code</div>
                    <div class="payment-card">Card</div>
                    <div class="payment-card">Cash</div>
                    <div class="payment-card">VN Pay</div>
                </div>
            </div>

            <button class="checkout-btn">Thanh Toán</button>
        </div>
    </div>

    <script>
        document.getElementById("tableNumber").textContent = 5; 
        const paymentCards = document.querySelectorAll('.payment-card');
        paymentCards.forEach(card => {
            card.addEventListener('click', () => {
                paymentCards.forEach(c => c.classList.remove('active'));
                card.classList.add('active');
            });
        });

        // Nút thanh toán
        document.querySelector('.checkout-btn').addEventListener('click', () => {
            const active = document.querySelector('.payment-card.active');
            if (active) {
                alert(`Bạn đã chọn phương thức: ${active.textContent}`);
            } else {
                alert('Vui lòng chọn phương thức thanh toán!');
            }
        });
    </script>

</body>
</html>