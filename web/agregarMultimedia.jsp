<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Multimedia</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #0a0a0a;
            color: #00eaff;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        h2 {
            font-size: 26px;
            text-shadow: 0 0 10px #00eaff, 0 0 20px #00eaff;
            padding: 20px;
        }
        form {
            max-width: 600px;
            margin: 30px auto;
            background: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px #00eaff;
            text-align: left;
        }
        label {
            font-size: 16px;
            color: #00eaff;
            margin-bottom: 8px;
            display: block;
            text-shadow: 0 0 5px #00eaff;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 4px;
            border: none;
            background-color: #131313;
            color: #00eaff;
            font-size: 16px;
            outline: none;
            box-shadow: 0 0 10px #00eaff;
        }
        textarea {
            height: 120px;
            resize: vertical;
        }
        button {
            width: 100%;
            background-color: #00eaff;
            color: #0a0a0a;
            font-size: 18px;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s ease;
            text-shadow: 0 0 5px #0a0a0a;
            box-shadow: 0 0 10px #00eaff, 0 0 20px #00eaff;
        }
        button:hover {
            background-color: #00b3cc;
            box-shadow: 0 0 20px #00b3cc, 0 0 30px #00b3cc;
        }
        a {
            color: #00eaff;
            text-decoration: none;
            font-size: 18px;
            display: inline-block;
            margin-top: 20px;
            text-shadow: 0 0 10px #00eaff;
        }
        a:hover {
            color: #00b3cc;
            text-shadow: 0 0 15px #00b3cc;
        }
    </style>
</head>
<body>

    <h2>Agregar Contenido Multimedia</h2>

    <form action="guardarMultimedia.jsp" method="post">
        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" required>

        <label for="descripcion">Descripción:</label>
        <textarea id="descripcion" name="descripcion"></textarea>

        <label for="url">URL:</label>
        <input type="text" id="url" name="url" required>

        <label for="tipo">Tipo de archivo:</label>
        <select name="tipo" id="tipo" required>
            <option value="Imagen">Imagen</option>
            <option value="Video">Video</option>
            <option value="Audio">Audio</option>
        </select>

        <button type="submit">Guardar</button>
    </form>

    <a href="index.html">Volver</a>

</body>
</html>
