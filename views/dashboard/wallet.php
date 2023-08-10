<?php include_once __DIR__ . '/header-dashboard.php'; ?>
<h1><?= $titulo ?></h1>
<?php if($insert === 1): ?>
    <h2>Se creó el nuevo estado de tu billetera</h2>
<?php elseif($insert === 2): ?>
    <h2>Ya existe tu billetera para el día de hoy. Si quieres puedes editarla</h2>
<?php endif; ?>

<a href="/ver-billetera">Billetera</a>

<?php include_once __DIR__ . '/footer-dashboard.php'; ?>