unit role CaseA::Plugins::Class1;

has Str $.works-name = 'This program';
has  @.holders = Array.new;

method gimme-five() {
    return 'five';
}
