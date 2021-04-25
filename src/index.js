const app = require('fastify')({
    logger: true
})

app.register(require('fastify-postgres'), {
    connectionString: process.env.DATABASE_URL
  })

app.get('/', function (req, reply) {
    reply.send({ hello: 'world' })
})

app.get('/user/:id', async (req, reply) => {
    const client = await app.pg.connect()
    const { rows } = await client.query(
      'SELECT id, username, birthday, email_confirmed, email, gender, password_digest, first_name, last_name, created_at FROM users WHERE id=$1', [req.params.id],
    )
    client.release()
    return rows
})

app.listen(process.env.PORT || 3000, '0.0.0.0', (err, address) => {
    if (err) {
        app.log.error(err)
        process.exit(1)
    }
    app.log.info(`server listening on ${address}`)
})
