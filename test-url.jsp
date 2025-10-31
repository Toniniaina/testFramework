<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test de Mapping d'URLs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .form-group {
            margin: 20px 0;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        .result {
            margin-top: 30px;
            padding: 20px;
            border-radius: 4px;
        }
        .result.success {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }
        .result.error {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }
        .result h3 {
            margin-top: 0;
        }
        .info {
            margin: 10px 0;
            padding: 10px;
            background-color: #e7f3ff;
            border-left: 4px solid #2196F3;
            border-radius: 4px;
        }
        .url-list {
            margin-top: 20px;
        }
        .url-item {
            padding: 8px;
            margin: 5px 0;
            background-color: #f9f9f9;
            border-left: 3px solid #4CAF50;
            cursor: pointer;
        }
        .url-item:hover {
            background-color: #e8f5e9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔍 Test de Mapping d'URLs</h1>
        
        <div class="info">
            <strong>Instructions:</strong> Entrez une URL pour rechercher le contrôleur et la méthode correspondants.
        </div>
        
        <form action="testUrl" method="post">
            <div class="form-group">
                <label for="url">URL à rechercher:</label>
                <input type="text" id="url" name="url" placeholder="/users" value="<%= request.getParameter("url") != null ? request.getParameter("url") : "" %>" required>
            </div>
            <button type="submit">Rechercher</button>
        </form>
        
        <% 
            String result = (String) request.getAttribute("result");
            String className = (String) request.getAttribute("className");
            String methodName = (String) request.getAttribute("methodName");
            String searchUrl = (String) request.getAttribute("searchUrl");
            Boolean found = (Boolean) request.getAttribute("found");
            
            if (result != null) {
        %>
            <div class="result <%= found ? "success" : "error" %>">
                <h3><%= found ? "✅ URL Trouvée" : "❌ 404 - URL Non Trouvée" %></h3>
                <p><strong>URL recherchée:</strong> <%= searchUrl %></p>
                <% if (found) { %>
                    <p><strong>Classe:</strong> <%= className %></p>
                    <p><strong>Méthode:</strong> <%= methodName %></p>
                <% } else { %>
                    <p>Aucun mapping trouvé pour cette URL.</p>
                <% } %>
            </div>
        <% } %>
        
        <div class="url-list">
            <h3>URLs de test disponibles:</h3>
            <div class="url-item" onclick="document.getElementById('url').value='/test';">/test</div>
            <div class="url-item" onclick="document.getElementById('url').value='/hello';">/hello</div>
            <div class="url-item" onclick="document.getElementById('url').value='/users';">/users</div>
            <div class="url-item" onclick="document.getElementById('url').value='/users/create';">/users/create</div>
            <div class="url-item" onclick="document.getElementById('url').value='/admin/dashboard';">/admin/dashboard</div>
            <div class="url-item" onclick="document.getElementById('url').value='/admin/settings';">/admin/settings</div>
        </div>
    </div>
</body>
</html>
