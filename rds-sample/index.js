const express = require('express')
const Sequelize = require('sequelize')

const app = express()
const port = 3000

app.use(express.json());

const sequelize = new Sequelize({
    database: "testdb",
    username: "postgres",
    password: "postgres",
    host: "terraform-20231201022300537000000001.cnl1scxppym1.us-east-1.rds.amazonaws.com",
    port: 5432,
    dialect: "postgres",
    dialectOptions: {
      ssl: {
        require: true,
        rejectUnauthorized: false
      }
    },
  });

sequelize.authenticate().then(() => {
    console.log('Connection has been established successfully.');
}).catch(err => {
    console.error('Unable to connect to the database:', err);
});

const User = sequelize.define('user', {
    firstName: {
        type: Sequelize.STRING,
        allowNull: false
    },
    lastName: {
        type: Sequelize.STRING
    }
});

User.sync({ force: true })

app.get('/', (_, res) => res.json({ message: 'Hello World' }))

app.post('/user', async (req, res) => {
    try {
        const newUser = new User(req.body)
        await newUser.save()
        res.json({ user: newUser })
    } catch(error) {
        console.error(error)
    }
})

app.get('/user/:userId', async (req, res) => {
    const userId = req.params.userId
    try {
        const user = await User.findAll({
            where: {
                id: userId
            }
        })
        res.json({ user })
    } catch(error) {
        console.error(error)
    }
})

app.listen(port, () => console.log(`Example app listening on port ${port}!`))