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

const getProduto = (request, response) => {
  pool.query('SELECT * FROM produto', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getProdutoById = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('SELECT * FROM produto WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const createProduto = (request, response) => {
     const {id,qtde,unmed,descricao,precocusto,precofinal} =  request.body
  pool.query('INSERT INTO produto (id,qtde,unmed,descricao,precocusto,precofinal) VALUES ($1, $2,$3,$4,$5,$6)', [id,qtde,unmed,descricao,precocusto,precofinal], (error, results) => {
    if (error) {

      throw error
    }
    response.status(200).send('Produto adicionad ${descricao}')
    response.status(201).send(`User added with`)
  })
}

const updateProduto = (request, response) => {
  const id = parseInt(request.params.id)
  const {qtde,unmed,descricao,precocusto,precofinal } = request.body

  pool.query(
    'UPDATE produto SET qtde = $1, unmed = $2, descricao=$3, precocusto = $4,precofinal=$5 WHERE id = $6',
    [id,qtde,unmed,descricao,precocusto,precofinal],
    (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`User modified with ID: ${id}`)
    }
  )
}

const deleteProduto = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('DELETE FROM produto WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).send(`User deleted with ID: ${id}`)
  })
}

module.exports = {
  getProduto,
  getProdutoById,
  createProduto,
  updateProduto,
  deleteProduto,
}
