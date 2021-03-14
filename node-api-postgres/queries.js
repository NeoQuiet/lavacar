const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'lavacar',
  password: 'postgres',
  port: 5432,
})
const getMarcas = (request, response) => {
  pool.query('SELECT * FROM marca ORDER BY id ASC', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getMarcasById = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('SELECT * FROM marca WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const createMarca = (request, response) => {
  const { id,marca, dtcad } = request.body

  pool.query('INSERT INTO marca (id,marca, dtcad) VALUES ($1, $2,$3)', [id,marca,dtcad], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`User added with ID: ${result.insertId}`)
  })
}

const updateMarca = (request, response) => {
  const id = parseInt(request.params.id)
  const { marca, dtcad } = request.body

  pool.query(
    'UPDATE marca SET marca = $1, dtcad = $2 WHERE id = $3',
    [marca,dtcad, id],
    (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`User modified with ID: ${id}`)
    }
  )
}

const deleteMarca = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('DELETE FROM marca WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).send(`User deleted with ID: ${id}`)
  })
}

module.exports = {
  getMarcas,
  getMarcasById,
  createMarca,
  updateMarca,
  deleteMarca,
}