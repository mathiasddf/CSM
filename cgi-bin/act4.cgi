#!"C:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
print $cgi->header('text/html');

my $year = $cgi->param('year');

my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:mysql:database=pweb1;host=localhost";

my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");

my $sth = $dbh->prepare("SELECT title, year, score, votes FROM Movie WHERE year = ?");
$sth->execute($year);

print "<html><body>";
print "<h2>Peliculas del anio $year </h2>";
print "<table border='1'><tr><th>Titulo</th><th>Anio</th><th>Puntuacion</th><th>Votos</th></tr>";

while(my ( $title, $year, $score, $votes)=$sth->fetchrow_array){
	print "<tr><td>$title</td><td>$year</td><td>$score</td><td>$votes</td></tr>";
}

print "</table>";		
print "</body></html>";
$sth->finish;
$dbh->disconnect;
