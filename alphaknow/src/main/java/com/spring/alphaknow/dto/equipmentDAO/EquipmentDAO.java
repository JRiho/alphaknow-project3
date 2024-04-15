package process;

import classDirectory.Equipment;
import java.util.List;

public interface EquipmentDAO {
    List<Equipment> getAllEquipments() throws Exception;
    void addEquipment(Equipment equipment) throws Exception;
    void deleteEquipment(int equipmentCode) throws Exception;
//	void updateEquipment(Equipment equipment) throws Exception;
	void updateEquipment(Equipment equipment) throws Exception;
}

