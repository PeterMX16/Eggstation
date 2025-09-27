<<<<<<< HEAD
=======
import { BooleanLike } from 'tgui-core/react';

import { Region } from '../common/AccessConfig';

>>>>>>> tg-pr-88929
export type AccessData = {
  name: string;
  number: number;
};

export type MainData = {
<<<<<<< HEAD
  isoperator: boolean;
=======
  isoperator: BooleanLike;
>>>>>>> tg-pr-88929
  ui_theme: string;
  name: string;
  integrity: number;
  integrity_max: number;
  power_level: number;
  power_max: number;
  mecha_flags: number;
  internal_damage: number;
  internal_damage_keys: string[];
  mechflag_keys: string[];

<<<<<<< HEAD
  can_use_overclock: boolean;
  overclock_mode: boolean;
  overclock_temp_percentage: number;

  one_access: boolean;
  regions: string[];
  accesses: string[];

  manipulator_rating: number;
=======
  can_use_overclock: BooleanLike;
  overclock_safety_available: BooleanLike;
  overclock_safety: BooleanLike;
  overclock_mode: BooleanLike;
  overclock_temp_percentage: number;

  one_access: BooleanLike;
  regions: Region[];
  accesses: string[];

  servo_rating: number;
>>>>>>> tg-pr-88929
  scanmod_rating: number;
  capacitor_rating: number;

  cabin_pressure_warning_min: number;
  cabin_pressure_hazard_min: number;
  cabin_pressure_warning_max: number;
  cabin_pressure_hazard_max: number;
  cabin_temp_warning_min: number;
  cabin_temp_hazard_min: number;
  cabin_temp_warning_max: number;
  cabin_temp_hazard_max: number;

  one_atmosphere: number;
  cabin_pressure: number;
  cabin_temp: number;
<<<<<<< HEAD
  enclosed: boolean;
  cabin_sealed: boolean;
  dna_lock: string | null;
  weapons_safety: boolean;
=======
  enclosed: BooleanLike;
  cabin_sealed: BooleanLike;
  dna_lock: string | null;
  weapons_safety: BooleanLike;
>>>>>>> tg-pr-88929
  mech_view: string;
  modules: MechModule[];
  selected_module_index: number;
  sheet_material_amount: number;
};

export type MechModule = {
<<<<<<< HEAD
  selected: boolean;
  slot: string;
  icon: string;
  name: string;
  detachable: boolean;
  can_be_toggled: boolean;
  can_be_triggered: boolean;
  active: boolean;
=======
  selected: BooleanLike;
  slot: string;
  icon: string;
  name: string;
  detachable: BooleanLike;
  can_be_toggled: BooleanLike;
  can_be_triggered: BooleanLike;
  active: BooleanLike;
>>>>>>> tg-pr-88929
  active_label: string;
  equip_cooldown: string;
  energy_per_use: number;
  snowflake: Snowflake;
  ref: string;
};

export type Snowflake = {
  snowflake_id: string;
  integrity: number;
};
