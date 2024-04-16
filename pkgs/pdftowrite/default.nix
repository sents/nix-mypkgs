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
    owner = "kosmospredanie";
    repo = "pdftowrite";
    rev = "2021.05.03";
    hash = "sha256-IFX9K74tfGKyMtqlc/RsV00baZEzE3HcPAGfrmTHnDQ=";
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
