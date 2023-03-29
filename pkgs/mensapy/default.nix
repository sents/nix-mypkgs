{ stdenv, lib, python311Packages }:
python311Packages.buildPythonPackage rec {
  pname = "mensapy";
  version = "0.3.0";

  src = fetchGit {
    url = "https://gitlabph.physik.fu-berlin.de/behrmann/mensapy.git";
    ref = "master";
    rev = "045895191d7ef89bedf999c3a222bd2634f9102f";
  };

  propagatedBuildInputs = with python311Packages; [ lxml requests beautifulsoup4 ];

  doCheck = false;

  postInstall = ''
  mv $out/bin/mensa.py $out/bin/mensapy
  '';

  meta = with lib; {
    description = "A berlin mensa website scraper";
    homepage = "https://gitlabph.physik.fu-berlin.de/behrmann/mensapy";
    license = licenses.gpl3;
  };
}
