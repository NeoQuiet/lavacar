const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'lavacar',
  password: 'postgres',
  port: 5432,
})

async function connect() {
  if (global.connection)
      return global.connection.connect();

  const { Pool } = require('pg');
  const pool = new Pool({
      connectionString: 'postgres://fyazuind:r34WG7VcdfJvN4WplbWYHEk-hfyYELv1@isilo.db.elephantsql.com:5432/fyazuind'
  });

  //apenas testando a conexão
  const client = await pool.connect();
  console.log("Criou pool de conexões no PostgreSQL!");

  const res = await client.query('SELECT NOW()');
  console.log(res.rows[0]);
  client.release();

  //guardando para usar sempre o mesmo
  global.connection = pool;
  return pool.connect();
}

const getMarcas = (request, response) => {
  pool.query('SELECT * FROM marca', (error, results) => {
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
     const {id,marca,dtcad} =  request.body
  pool.query('INSERT INTO marca (id,marca, dtcad) VALUES ($1, $2,$3)', [id,marca,dtcad], (error, results) => {
    if (error) {

      throw error
    }
    response.status(200).send('Marca adicionad ${marca}')
    response.status(201).send(`User added with`)
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
