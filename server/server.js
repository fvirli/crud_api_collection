const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000; 

// Middleware untuk parsing body dari request
app.use(bodyParser.json());

let targetData = [
  { id: '1', name: 'Read Books', amount: 20, targetTime: '2024-12-31', description: 'read your wishlist book' },
  { id: '2', name: 'buy album', amount: 2, targetTime: '2024-12-31', description: 'BTS Album' },
];

// Endpoint untuk mendapatkan semua target
app.get('/mycollect', (req, res) => {
  res.json(targetData);
});

// Endpoint untuk menambahkan target baru
app.post('/post', (req, res) => {
  const newTarget = req.body;
  targetData.push(newTarget);
  res.json({ message: 'Target added successfully', target: newTarget });
});

// Endpoint untuk mengupdate target berdasarkan ID
app.put('/update/:id', (req, res) => {
  const targetId = req.params.id;
  const updatedTarget = req.body;

  targetData = targetData.map((target) => {
    return target.id === targetId ? updatedTarget : target;
  });

  res.json({ message: 'Target updated successfully', target: updatedTarget });
});

// Endpoint untuk menghapus target berdasarkan ID
app.delete('/delete/:id', (req, res) => {
  const targetId = req.params.id;
  targetData = targetData.filter((target) => target.id !== targetId);
  res.json({ message: 'Target deleted successfully', deletedId: targetId });
});

app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}}`);
});
 