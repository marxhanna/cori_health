const express = require("express");
const path = require("path");
const https = require("https");
const fs = require("fs");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const app = express();
const PORT = 3000;

app.set("view engine", "ejs");
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "assets")));
app.use(express.static(path.join(__dirname, "views")));
app.use(express.static(path.join(__dirname, "libs")));

app.get("/", (req, res) =>
  res.sendFile(path.join(__dirname, "views", "/index.html"))
);

const cefaleiaConfig = {
  host: "localhost",
  user: "root",
  password: "",
  database: "cefaleia",
  connectionLimit: 10,
};

const dorAbdominalConfig = {
  host: "localhost",
  user: "root",
  password: "",
  database: "dor_abdominal",
  connectionLimit: 10,
};

const cefaleiaPool = mysql.createPool(cefaleiaConfig);
const dorAbdominalPool = mysql.createPool(dorAbdominalConfig);

const dbConfigs = {
  cefaleia: cefaleiaPool,
  dorAbdominal: dorAbdominalPool,
};

function queryDatabase(pool, sql, values) {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) {
        reject(err);
        return;
      }

      connection.query(sql, values, (queryError, results) => {
        connection.release();

        if (queryError) {
          reject(queryError);
          return;
        }

        resolve(results);
      });
    });
  });
}

//******************************************************************************************************* */

app.post("/api/receber_alarme", async (req, res) => {
  try {
    const results = await queryDatabase(
      cefaleiaPool,
      "SELECT * FROM sinais",
      []
    );

    res.render("sda", { dados: results });
  } catch (err) {
    console.error(`Error fetching alarm signal data for Cefaleia:`, err);
    return res.status(500).json({
      error: `Error fetching alarm signal data for Cefaleia`,
    });
  }
});

//******************************************************************************************************* */
let consultaResult = null;
let examesResult = null;

app.post("/api/receber_diagnostico", async (req, res) => {
  try {
    const selectedCheckboxes = req.body.sinais_selecionados;
    console.log(selectedCheckboxes);

    const sql = `SELECT DISTINCT Diagnostico
FROM (
    SELECT sinal_alarme, Diagnostico1 AS Diagnostico FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico2 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico3 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico4 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico5 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico6 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico7 FROM sinais
    UNION ALL
    SELECT sinal_alarme, Diagnostico8 FROM sinais
	UNION ALL
    SELECT sinal_alarme, Diagnostico9 FROM sinais
) AS subquery
WHERE Diagnostico IS NOT NULL
AND sinal_alarme IN (?);
`;

    const values = selectedCheckboxes;
    consultaResult = JSON.parse(
      JSON.stringify(await queryDatabase(cefaleiaPool, sql, values))
    );
    console.log(consultaResult);
    res.render("diagnostico", { data: consultaResult });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
});

//******************************************************************************************************* */

// Remova a declaração de examesResult neste local

app.post("/api/receber_exame", async (req, res) => {
  try {
    const receivedData = req.body.sinais_selecionados;

    if (receivedData == null) {
      throw new Error("Received data is missing");
    }

    const sql = `SELECT DISTINCT Exame
      FROM (
          SELECT DiagnosticoNome AS Diagnostico, Exame1 AS Exame FROM diagnostico
          UNION ALL
          SELECT DiagnosticoNome, Exame2 FROM Diagnostico
          UNION ALL
          SELECT DiagnosticoNome, Exame3 FROM Diagnostico
          UNION ALL
          SELECT DiagnosticoNome, Exame4 FROM Diagnostico
          UNION ALL
          SELECT DiagnosticoNome, Exame5 FROM Diagnostico
          UNION ALL
          SELECT DiagnosticoNome, Exame6 FROM Diagnostico
      ) AS subquery
      WHERE Exame IS NOT NULL
      AND Diagnostico IN (?);`;

    const values = receivedData;
    examesResult = JSON.parse(
      JSON.stringify(await queryDatabase(cefaleiaPool, sql, values))
    );
    console.log(examesResult);
    res.render("exames", { data: examesResult });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

//******************************************************************************************************* */

app.post("/api/receber_descricao", async (req, res) => {
  try {
    const dados = examesResult;

    if (!dados) {
      throw new Error("Received data is missing");
    }

    // Extract the diagnoses into an array of strings
    const exame = dados.map((item) => item.Exame);

    // Create placeholders for the parameter values in the query
    const placeholders = exame.map(() => "?").join(",");

    const sql = `SELECT DISTINCT Exame, Descricao
                FROM Exame
                WHERE Exame IN (?);
                `;

    const values = exame; // Use the array of Exame directly

    descricaoResult = JSON.parse(
      JSON.stringify(await queryDatabase(cefaleiaPool, sql, values))
    );
  } catch (error) {
    // Handle errors
    console.error(error);
    return res.status(500).json({ error: "Internal Server Error" });
  }
});

//******************************************************************************************************* */
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
