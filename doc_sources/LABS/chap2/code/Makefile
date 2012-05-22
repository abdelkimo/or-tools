OR_TOOLS_TOP=/home/nikolaj/Documents/RESEARCH/google/or-tools-read-only
include $(OR_TOOLS_TOP)/Makefile

TARGET = 

CPBINARIES = \
	$(TARGET)$E

cpexe: $(CPBINARIES)
	@echo Compiled $(CPBINARIES)

$(TARGET).$O: $(TARGET).cc
	$(CCC) $(CFLAGS) -c $(TARGET).cc -o $(TARGET).$O

$(TARGET)$E: $(TARGET).$O
	$(CCC) $(CFLAGS) $(TARGET).$O $(CP_LNK) $(LDFLAGS) -o $(TARGET)$E

local_clean:
	$(DEL) *.$O
	$(DEL) $(CPBINARIES)
