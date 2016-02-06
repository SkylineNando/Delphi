unit PerfCounter;

interface

uses Windows;

type

  TPerfCounter = class
  private
    Freq, StartCount, StopCount: Int64;
    FTimingSeconds: real;
  public
    constructor Create;
    procedure Start;
    procedure Stop;
    property TimingSeconds : Real read FTimingSeconds;
  end;

implementation

{ TPerfCounter }

constructor TPerfCounter.Create;
begin
  inherited;

  QueryPerformanceFrequency(Freq);

end;

procedure TPerfCounter.Start;
begin
  QueryPerformanceCounter(StartCount);
end;

procedure TPerfCounter.Stop;
begin
  QueryPerformanceCounter(StopCount);
  FTimingSeconds := (StopCount - StartCount) / Freq;
end;

end.
