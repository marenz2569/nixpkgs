{ stdenv, fetchPypi, buildPythonPackage
, pythonOlder, isPy3k
, nose }:

buildPythonPackage rec {
  pname = "rcfile";
  version = "0.1.4";

  disabled = pythonOlder "2.6" || (isPy3k && pythonOlder "3.3");

  src = fetchPypi {
    inherit pname version;
    sha256 = "1ycbbzx3lshdjjin1lnypknhk7iy2vhr1z7g31y2g9l23dzapg91";
  };

  checkInputs = [ nose ];

  meta = with stdenv.lib; {
    description = "Configuration file loader for Python projects";
    homepage = https://github.com/aequitas/rcfile;
    license = licenses.mit;
    maintainers = [ maintainers.marenz ];
  };
}
