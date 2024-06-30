#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use DBI;

my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:mysql:database=pweb1;host=localhost";


my $dbh = DBI->connect($dsn, $user, $password)or die("No se pudo conectar!");


# Consulta al SGBD
my $sth = $dbh->prepare("SELECT Name FROM Actor WHERE Actorid=5");
$sth->execute();
my ($actor_name) = $sth->fetchrow_array;


# Imprimimos el resultado
print "Content-type: text/html\n\n";
print "<html><body>";
print "<h2>Nombre del actor con ID 5: $actor_name</h2>";
print "</body></html>";

# Desconectamos de la base de datos
$sth->finish;
$dbh->disconnect;
