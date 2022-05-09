inline cacheing
flushICacheFrom: startAddress "<Integer>" to: endAddress "<Integer>"
	"Flush the instruction cache from (startAddress to endAddress].
	 If there is a dual mapped code zone (the normal zone but marked with read/execute, and a
	 read/write zone codeToDataDelta bytes away) then also flush the data cache for the corresp-
	 onding range in the read/write zone and invalidate the data cache for the read/execute zone."
	 self flag: #todo.
	"not sure what to do here as riscv doesn't seem to support explicit flush"