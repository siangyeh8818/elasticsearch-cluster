# elasticsearch-cluster

注意事項:
------
運行時發生max virtual memory areas vm.max_map_count [65530] likely too low, increase to at least [262144]  的錯誤的話
請調整系統參數
    sudo sysctl -w vm.max_map_count=262144  或是 vim /etc/sysctl.conf  加入vm.max_map_count=262144
max_map_count文件包含限制一个process可以拥有的VMA的數量,process到了VMA上限但又只能釋放少量的memory给其他的kernel-process使用时，就引發錯誤
