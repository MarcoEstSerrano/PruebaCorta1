<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Multimedia</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        h2 {
            text-align: center;
            color: #333;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            margin: 0;
        }
        form {
            max-width: 600px;
            margin: 30px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        label {
            font-size: 16px;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border-radius: 4px;
            border: 1px solid #ddd;
            font-size: 14px;
        }
        textarea {
            height: 120px;
            resize: vertical;
        }
        button {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        footer {
            text-align: center;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            margin-top: 40px;
        }
    </style>
</head>
<body>

    <h2>Agregar Contenido Multimedia</h2>

    <form action="guardarMultimedia.jsp" method="post">
        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" required><br>

        <label for="descripcion">Descripción:</label>
        <textarea id="descripcion" name="descripcion"></textarea><br>

        <label for="url">URL:</label>
        <input type="text" id="url" name="url" required><br>

        <label for="tipo">Tipo de archivo:</label>
        <select name="tipo" id="tipo" required>
            <option value="Imagen">Imagen</option>
            <option value="Video">Video</option>
            <option value="Audio">Audio</option>
        </select><br>

        <button type="submit">Guardar</button>
        
        
    </form>

    <li><a href="index.html">Volver</a></li>
