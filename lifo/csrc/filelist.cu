PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _4431_archive_1.so
_4431_archive_1.so : archive.0/_4431_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -m elf_i386 -shared  -o .//../simv.daidir//_4431_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4431_archive_1.so $@






%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \


CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
amcQwB.o objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

