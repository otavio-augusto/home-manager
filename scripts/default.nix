{pkgs, ...}: let
  # WEATHER
  wttr = pkgs.writers.writeNuBin "wttr" {} ''
    http get https://wttr.in/ | lines | skip 1 | take 36 | to text
  '';

  #DICTIONARY
  dict =
    pkgs.writers.writeNuBin "dict" {}
    ''
      def main [...args: string] {
        let word = $args | first
        let response = http get $"https://api.dictionaryapi.dev/api/v2/entries/en_US/($word)" | select word phonetic meanings

        let word = $response.word | first
        let phonetic = $response.phonetic | first
        let meanings = $response.meanings | first

        let output = $"($word) \n($phonetic) \n \n($meanings.definitions | first | get definition | to text)"

        $output
      }
    '';
in {
  home.packages = [wttr dict];
}
