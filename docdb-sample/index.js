const express = require('express');
const mongoose = require('mongoose');

mongoose.connect("mongodb://docb_test_admin:admin123456@dev-docdb-test.cluster-cnl1scxppym1.us-east-1.docdb.amazonaws.com:27017/?replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false");
const database = mongoose.connection;

database.on('error', (error) => {
    console.log(error)
})

database.once('connected', () => {
    console.log('Database Connected');
})

const dataSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String
    },
    age: {
        required: true,
        type: Number
    }
})

const Model = mongoose.model('Data', dataSchema)

const app = express();

app.use(express.json());

app.get('/', (_, res) => res.json({ message: 'Hello World' }))

app.post('/post', async (req, res) => {
    const data = new Model({
        name: req.body.name,
        age: req.body.age
    })

    try {
        const dataToSave = await data.save();
        res.status(200).json(dataToSave)
    }
    catch (error) {
        res.status(400).json({message: error.message})
    }
})

app.get('/getAll', async (req, res) => {
    try{
        const data = await Model.find();
        res.json(data)
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

app.listen(3000, () => {
    console.log(`Server Started at ${3000}`)
})