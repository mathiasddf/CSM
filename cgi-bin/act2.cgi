#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use DBI;

my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:mysql:database=pweb1;host=localhost";

my $dbh = DBI->connect($dsn, $user, $password)or die("No se pudo conectar!");

#busqueda
my $sth= $dbh->prepare("SELECT * FROM Movie WHERE Year = 1985");
$sth->execute();

print "Content-type: text/html\n\n";
print "<html><body>";
print "<h2>Peliculas de 1985 </h2>";
print "<table border='1'><tr><th>Titulo</th><th>Anio</th><th>Puntuacion</th><th>Votos</th></tr>";

while(my ($id, $title, $year, $score, $votes)=$sth->fetchrow_array){
	print "<tr><td>$title</td><td>$year</td><td>$score</td><td>$votes</td></tr>";
}

print "</table>";		
print "</body></html>";
$sth->finish;

$dbh->disconnect;
	