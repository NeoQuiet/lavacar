const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = 3030
const cors = require('cors');

app.use((req, res, next) => {
    
	//Qual site tem permissão de realizar a conexão, no exemplo abaixo está o "*" indicando que qualquer site pode fazer a conexão
    res.header("Access-Control-Allow-Origin", "*");
	//Quais são os métodos que a conexão pode realizar na API
    res.header("Access-Control-Allow-Methods", 'GET,PUT,POST,DELETE');
    app.use(cors());
    next();
});

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/', (request, response) => {
  response.json({ info: 'Node.js, Express, and Postgres API' })
})

app.get('/marca', db.getMarcas)
app.get('/marca/:id', db.getMarcasById)
app.post('/marca', db.createMarca)
app.put('/marca/:id', db.updateMarca)
app.delete('/marca/:id', db.deleteMarca)
app.get('/produto', db.getProduto)
app.get('/produto/:id', db.getProdutoById)
app.post('/produto', db.createProduto)
app.put('/produto/:id', db.updateProduto)
app.delete('/produto/:id', db.deleteProduto)

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})
