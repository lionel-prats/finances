<?php include_once __DIR__ . '/header-dashboard.php'; ?>
<?php if(!count($currentAccounts)): ?>
    <p class="no-proyectos">
        Aún no has creado ninguna cuenta.
        <a href="/crear-cuenta">Haz click para crear la primera.</a>
    </p>
<?php else: ?>
    <ul class="listado-proyectos">
        <?php foreach($currentAccounts as $account): ?>
            <li class="proyecto">
                <a href="/cuenta?id=<?= $account->url; ?>"><?= $account->name; ?></a>
            </li>
        <?php endforeach; ?>
    </ul>
<?php endif; ?>

<?php include_once __DIR__ . '/footer-dashboard.php'; ?>

<?php 
    $script = '
        <script src="build/js/dashboard/index.js"></script>
    ';
?>