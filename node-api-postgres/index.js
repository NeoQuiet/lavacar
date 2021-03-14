const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = 3030

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

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})