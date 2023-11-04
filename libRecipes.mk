ifdef DIRS
$(DIRS):
	@$(MAKE) -C $@ $(J)
endif

NAME := $(addsuffix .a, $(shell basename $(shell pwd)))

all bonus :
ifdef DIRS
	@$(MAKE) $(DIRS)
endif
	@$(call color_printf,$(CYAN),$(NAME),🎯 starting compile $(NAME))
	@$(MAKE) $(NAME)
	@$(call color_printf,$(GREEN),$(NAME),🔰 done!)

$(NAME): $(OBJS) $(LIBS)
	@$(call color_printf,$(GREEN),$(NAME),📚 archive object)
	$(AR) $(ARFLAGS) $@ $^
	@$(MAKE) files="$(NAME)" src_dir=`pwd` dst_dir=$(TOPDIR)/src/lib link_files

clean:
	@$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $(J) $@;)
	@$(MAKE) files="$(NAME)" src_dir=`pwd` dst_dir=$(TOPDIR)/src/lib unlink_files
	@$(call color_printf,$(RED),$(NAME),🗑️  remove Objects && Dependency file)
	$(RM) $(OBJS) $(DEPS)

fclean: clean
	@$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $(J) $@;)
	@$(call color_printf,$(RED),$(NAME),🗑️  remove $(NAME))
	$(RM) $(NAME)

re : fclean
	@$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $(J) $@;)
	$(MAKE) all

.PHONY: all clean fclean re bonus $(DIRS)