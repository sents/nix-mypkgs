{ stdenv, lib, python3Packages, fetchFromGitHub,
  inkscape, poppler_utils, gzip,
  pdftk, librsvg,
  #wkhtmltopdf,
}:
python3Packages.buildPythonPackage rec {
  pname = "pdftowrite";
  version = "2021.05.03";

  src = fetchFromGitHub
 {
    owner = "sents";
    repo = "pdftowrite";
    rev = "2024.04.17";
    hash = "sha256-YK0GmpDOE95Gx4TzPYHrc4J4Ai4j0ihbwfmQqlvoqPc=";
  };

  BuildInputs = [
    inkscape
    poppler_utils
    gzip
    # wkhtmltopdf  -- uses deprecatet qtwebkit (only needed for svgz -> pdf)
    pdftk
    librsvg
  ];
  propagatedBuildInputs = with python3Packages;
                  [ shortuuid picosvg ];

  doCheck = false;

  meta = with lib; {
    description = "Convert pdf to svgz for Sylus Labs Write";
    homepage = "https://github.com/kosmospredanie/pdftowrite";
    license = licenses.mit;
  };
}
