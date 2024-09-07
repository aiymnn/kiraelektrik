<?php
require 'config/connection.php';

function calculatePower($voltage, $current) {
    return $voltage * $current;
}

function calculateEnergy($power, $hours) {
    return ($power * $hours) / 1000;
}

function calculateTotalCharge($energy, $rate) {
    return $energy * ($rate / 100);
}

$power = $energy = $totalCharge = 0; // Initialize variables

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $voltage = $_POST["voltage"];
    $current = $_POST["current"];
    $rate = $_POST["rate"];
    $hours = $_POST["hours"];

    $power = calculatePower($voltage, $current);
    $energy = calculateEnergy($power, $hours);
    $totalCharge = calculateTotalCharge($energy, $rate);

    $sql = "INSERT INTO electricity_calculation (hours, energy, total_charge) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("idd", $hours, $energy, $totalCharge);
    $stmt->execute();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Electricity Cost Calculator</title>
</head>
<body>
    <?php

    date_default_timezone_set('Asia/Kuala_Lumpur');

    $currentDateTime = date('d/m/y, h:i');

    echo $currentDateTime;
    ?>
    <div class="container mt-5">
        <h2><strong>Calculate</strong></h2>
        <form method="post" class="mt-3">
            <div class="mb-3">
                <label for="voltage" class="form-label">Voltage (V)</label>
                <input type="number" step="any" class="form-control" id="voltage" name="voltage" required value="19">
            </div>
            <div class="mb-3">
                <label for="current" class="form-label">Current (A)</label>
                <input type="number" step="any" class="form-control" id="current" name="current" required value="3.24">
            </div>
            <div class="mb-3">
                <label for="rate" class="form-label">CURRENT RATE (sen/kWh)</label>
                <input type="number" step="any" class="form-control" id="rate" name="rate" required value="21.80">
            </div>
            <div class="mb-3">
                <label for="hours" class="form-label">Hours</label>
                <input type="number" class="form-control" id="hours" name="hours" required>
            </div>
            <div style="display: flex; justify-content: center;">
                <button type="submit" class="btn btn-primary">Calculate</button>
            </div>
        </form>

            <div class="border border-primary rounded p-3 bg-light mt-4" style="color: #007bff;"> <!-- Inline style for demonstration -->
                <p class="mb-1"><strong>POWER: 0.06156kW</strong></p>
                <p class="mb-0"><strong>RATE: 0.218RM</strong></p>
            </div>

        <table class="table mt-3">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Hours</th>
                    <th>Energy (kWh)</th>
                    <th>Total (RM)</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sql = "SELECT * FROM electricity_calculation ORDER BY id ASC";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>
                            <td><strong>".$row["id"]."</strong></td>
                            <td>".$row["hours"]."</td>
                            <td>".number_format($row["energy"], 5)."</td>
                            <td>".number_format($row["total_charge"], 2)."</td>
                        </tr>";
                    }
                } else {
                    echo "<tr><td colspan='4'>No data available</td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
