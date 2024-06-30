#!C:\xampp\perl\bin\perl.exe
use strict;
use warnings;
use CGI;
use DBI;

# Crear el objeto CGI
my $cgi = CGI->new;

# Obtener parámetros de la solicitud
my $user_email = $cgi->param('user_email');
my $password = $cgi->param('pass');

# Configuración de la base de datos
my $dsn = "DBI:mysql:database=encomiendascsm;host=localhost";
my $db_username = 'alumno';
my $db_password = 'pweb1';

# Conectar a la base de datos
my $dbh = DBI->connect($dsn, $db_username, $db_password)
    or die "No se pudo conectar ";

# Preparar la consulta SQL
my $sth_check = $dbh->prepare('SELECT * FROM usuarios WHERE (usuario_nombre = ? OR usuario_email = ?) AND usuario_password = ?');
$sth_check->execute($user_email, $user_email, $password);  

# Comprobar si se encontró alguna fila
if ($sth_check->fetchrow_array) {
    print $cgi->redirect('/CSM/index.html');  
} else {
    print $cgi->redirect('/CSM/login.html?error=1');  
}

# Limpiar y desconectar
$sth_check->finish;
$dbh->disconnect;

