# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    funcs.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.kr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/15 10:06:39 by jgo               #+#    #+#              #
#    Updated: 2023/10/04 20:35:59 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## printf function define
ifndef color_printf
define color_printf
	@echo "$(1)\n[$(2)] $(3)$(DEF_COLOR)"
endef
endif

link_files:: unlink_files
		@$(shell mkdir -p $(dst_dir))
		@$(foreach file,$(files), $(call color_printf,$(CYAN),$(file),🔗 linking file\n) ln -sf $(src_dir)/$(file) $(dst_dir);)
		@$(foreach file,$(files), ln -sf $(src_dir)/$(file) $(dst_dir);)

unlink_files::
		@$(foreach file,$(files), $(call color_printf,$(GRAY),$(file),🚫 unlinking file\n) $(RM) $(dst_dir)/$(file);)
		@$(foreach file,$(files), $(RM) $(dst_dir)/$(file);)
