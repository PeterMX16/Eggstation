import { strict as assert } from "node:assert";
import fs from "node:fs";
import { extractDetails } from "./rerunFlakyTests.js";

function extractDetailsFromPayload(filename) {
<<<<<<< HEAD
  return extractDetails(
    fs.readFileSync(`tests/flakyTestPayloads/${filename}.txt`, {
      encoding: "utf8",
    }),
  );
=======
	return extractDetails(
		fs.readFileSync(`tests/flakyTestPayloads/${filename}.txt`, {
			encoding: "utf8",
		})
	);
>>>>>>> tg-pr-88929
}

const chatClient = extractDetailsFromPayload("chat_client");
assert.equal(
<<<<<<< HEAD
  chatClient.title,
  "Flaky hard delete: /datum/computer_file/program/chatclient",
=======
	chatClient.title,
	"Flaky hard delete: /datum/computer_file/program/chatclient"
>>>>>>> tg-pr-88929
);
assert.equal(chatClient.failures.length, 1);

const monkeyBusiness = extractDetailsFromPayload("monkey_business");
assert.equal(
<<<<<<< HEAD
  monkeyBusiness.title,
  "Flaky test monkey_business: Cannot execute null.resolve().",
=======
	monkeyBusiness.title,
	"Flaky test monkey_business: Cannot execute null.resolve()."
>>>>>>> tg-pr-88929
);
assert.equal(monkeyBusiness.failures.length, 1);

const shapeshift = extractDetailsFromPayload("shapeshift");
assert.equal(
<<<<<<< HEAD
  shapeshift.title,
  "Multiple errors in flaky test shapeshift_spell",
=======
	shapeshift.title,
	"Multiple errors in flaky test shapeshift_spell"
>>>>>>> tg-pr-88929
);
assert.equal(shapeshift.failures.length, 16);

const multipleFailures = extractDetailsFromPayload("multiple_failures");
assert.equal(
<<<<<<< HEAD
  multipleFailures.title,
  "Multiple flaky test failures in more_shapeshift_spell, shapeshift_spell",
=======
	multipleFailures.title,
	"Multiple flaky test failures in more_shapeshift_spell, shapeshift_spell"
>>>>>>> tg-pr-88929
);
assert.equal(multipleFailures.failures.length, 2);

const invalidTimer = extractDetailsFromPayload("invalid_timer");
assert.equal(
<<<<<<< HEAD
  invalidTimer.title,
  "Flaky test monkey_business: Invalid timer: /datum/looping_sound/proc/start_sound_loop() on /datum/looping_sound/showering",
=======
	invalidTimer.title,
	"Flaky test monkey_business: Invalid timer: /datum/looping_sound/proc/start_sound_loop() on /datum/looping_sound/showering"
>>>>>>> tg-pr-88929
);
