<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    $host = 'localhost';
    $dbname = 'new_database';
    $user = 'andser';
    $pass = '0665531275';

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Читаем SQL из файла
        $sql = file_get_contents('db_data.session.sql');

        // Выполняем запросы из файла
        $queries = explode(';', $sql);

        foreach ($queries as $query) {
            $query = trim($query);
            if (!empty($query)) {
                if (stripos($query, 'SELECT') === 0) {
                    // SELECT запрос - выводим результат
                    $stmt = $pdo->query($query);
                    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    echo "<table border='1' cellpadding='5'>";
                    if (!empty($results)) {
                        echo "<tr>";
                        foreach (array_keys($results[0]) as $column) {
                            echo "<th>$column</th>";
                        }
                        echo "</tr>";
                        foreach ($results as $row) {
                            echo "<tr>";
                            foreach ($row as $value) {
                                echo "<td>$value</td>";
                            }
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td>Нет данных</td></tr>";
                    }
                    echo "</table>";
                } else {
                    // Остальные запросы выполняем без вывода
                    $pdo->exec($query);
                }
            }
        }
    } catch (PDOException $e) {
        echo "Ошибка: " . $e->getMessage();
    }
    ?>
</body>

</html>