<?php include_once __DIR__ . '/header-dashboard.php'; ?>
<div class="contenedor-sm">
    <?php include_once __DIR__ . '/../templates/alertas.php'; ?>
    <form class="formulario" method="POST">
        <?php include_once __DIR__ . '/formulario-cuenta.php'; ?>
        <input type="submit" value="Crear Cuenta" class="boton">
    </form>
</div><!-- .contenedor-sm -->
<?php include_once __DIR__ . '/footer-dashboard.php'; ?>