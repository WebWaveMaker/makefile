# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    libRecipes.mk                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.kr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/04 20:05:53 by jgo               #+#    #+#              #
#    Updated: 2023/10/04 20:47:35 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifdef DIRS
$(DIRS):
	@$(MAKE) -C $@ $(J)
endif

NAME := $(shell basename $(shell pwd))

all bonus :
ifdef DIRS
	@$(MAKE) $(DIRS)
endif
	@$(call color_printf,$(CYAN),$(NAME),🎯 starting compile $(NAME))
	@$(MAKE) $(NAME)
	@$(call color_printf,$(GREEN),$(NAME),🔰 done!)

$(NAME): $(OBJS)
	@$(shell touch $(NAME))

$(DSTDIR)/objs :
	@mkdir -p $(DSTDIR)/objs

$(DSTDIR)/objs/%.o: %.cpp | $(DSTDIR)/objs
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

fclean clean:
	@$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $(J) $@;)
	@$(call color_printf,$(RED),$(NAME),🗑️  remove Objects && Dependency file)
	$(RM) $(OBJS) $(DEPS) $(NAME)

re : fclean
	@$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $(J) $@;)
	$(MAKE) all

.PHONY: all clean fclean re bonus $(NAME) $(DIRS)