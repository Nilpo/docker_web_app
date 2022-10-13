'use strict'

const express = require('express')

// Constants
const PORT = 8080
const HOST = '0.0.0.0'
const PATH = '/views/'

// App
const app = express()
app.use(express.static('static')) // serve static files from directory
// app.get('/', (req, res) => {
//   res.status(200).type('html').send('Hello World')
// })

const router = express.Router()
router.use(() => {
  console.log('/' + req.method)
  next()
})
router.get('/', (req, res) => {
  // res.sendFile(PATH + 'index.html')
  res.status(200).type('html').send('Hello World')
})

// app.listen(PORT, HOST)
// console.log(`Running on http://${HOST}:${PORT}`)
app.listen(PORT, HOST, () => console.log(`Running on http://${HOST}:${PORT}`))
